

package Model;

public class Account {
    private int userID;
    private String username;
    private String password;
    private String email;
    private int point;
    private int rankID;
    
    public Account(){}

    public Account(int userID, String username, String password, String email, int point, int rankID) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.point = point;
        this.rankID = rankID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getRankID() {
        return rankID;
    }

    public void setRankID(int rankID) {
        this.rankID = rankID;
    }
    

    
}