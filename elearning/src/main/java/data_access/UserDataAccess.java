package data_access;

import data_access.internal.DataAccess;
import model.Account;
import model.Account.Role;
import model.User;
import model.User.Gender;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Base64;

public class UserDataAccess {
    private static UserDataAccess INSTANCE;

    private UserDataAccess() {

    }
    
    public static UserDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new UserDataAccess();
        }
        return INSTANCE;
    }

    public boolean register(String email, String password, Role role) {
        boolean success = false;
        String sp = "{call spRegisterAccount(?, ?, ?, ?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            byte[] salt = generateSalt();
            String hash = hashPassword(password, salt);
            String dbPassword = hash + ":" + Base64.getEncoder().encodeToString(salt);

            statement.setString("Email", email);
            statement.setString("Password", dbPassword);
            statement.setString("Role", Account.roleToString(role));
            statement.registerOutParameter("Success", java.sql.Types.BIT);
            statement.execute();
            success = statement.getBoolean("Success");
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return success;
    }

    public User authenticate(String email, String password) {
        String sp = "{call spGetUserByEmail(?)}";
        User user = null;

        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String dbPassword = res.getString("password_hash");
                String[] hashSalt = dbPassword.split(":");
                String storedHash = hashSalt[0];
                byte[] salt = Base64.getDecoder().decode(hashSalt[1]);
                String hash = hashPassword(password, salt);
                if (hash.equals(storedHash)) {
                    int id = res.getInt("id");
                    String firstName = res.getString("first_name");
                    String lastName = res.getString("last_name");
                    Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                    LocalDate dob = null;
                    if (res.getDate("date_of_birth") != null) {
                        dob = res.getDate("date_of_birth").toLocalDate();
                    }
                    String profileImagePath = res.getString("profile_image");

                    int accountId = res.getInt("account_id");
                    String accountEmail = res.getString("email");
                    boolean activated = res.getBoolean("activated");
                    Role role = Role.valueOf(res.getString("role_name"));
                    LocalDateTime createdAt = null;
                    if (res.getTimestamp("created_at") != null) {
                        createdAt = res.getTimestamp("created_at").toLocalDateTime();
                    }
                    user = new User(
                        id, new Account(accountId, accountEmail, activated, role, createdAt),
                        firstName, lastName, gender, dob, profileImagePath
                    );
                    break;
                }
            }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean activate(String email) {
        boolean success = false;
        String sp = "{call spActivateAccount(?, ?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.registerOutParameter("Success", java.sql.Types.BIT);
            statement.execute();
            success = statement.getBoolean("Success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public User getUserByEmail(String email) {
        String sp = "{call spGetUserByEmail(?)}";
        User user = null;
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                LocalDate dob = null;
                if (res.getDate("date_of_birth") != null) {
                    dob = res.getDate("date_of_birth").toLocalDate();
                }
                String profileImagePath = res.getString("profile_image");

                int accountId = res.getInt("account_id");
                String accountEmail = res.getString("email");
                boolean activated = res.getBoolean("activated");
                Role role = Role.valueOf(res.getString("role_name"));
                LocalDateTime createdAt = null;
                if (res.getTimestamp("created_at") != null) {
                    createdAt = res.getTimestamp("created_at").toLocalDateTime();
                }
                user = new User(
                    id, new Account(accountId, accountEmail, activated, role, createdAt),
                    firstName, lastName, gender, dob, profileImagePath
                );
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean isPasswordSet(String email) {
        String sql = "select [password_hash] from [account] where [email] = ?";
        boolean isSet = false;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String password = res.getString("password_hash");
                if (password != null) {
                    isSet = true;
                }
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSet;
    }

    public boolean updatePassword(String email, String password) {
        String sql = "update [account] set [password_hash] = ? where [email] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            byte[] salt = generateSalt();
            String hash = hashPassword(password, salt);
            String dbPassword = hash + ":" + Base64.getEncoder().encodeToString(salt);

            statement.setString(1, dbPassword);
            statement.setString(2, email);
            statement.execute();
            return true;
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return false;
    }

    private byte[] generateSalt() {
        byte[] salt = new byte[16];
        new SecureRandom().nextBytes(salt);
        return salt;
    }
    
    private String hashPassword(String password, byte[] salt)
            throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.reset();
        md.update(salt);
        byte[] hash = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hash);
    }
}
