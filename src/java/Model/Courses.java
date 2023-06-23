
package Model;


public class Courses {
    private int courseID;
    private String courseName;
    private String courseImg;
   
    public Courses(){}

    public Courses(int courseID, String courseName, String courseImg) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.courseImg = courseImg;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseImg() {
        return courseImg;
    }

    public void setCourseImg(String courseImg) {
        this.courseImg = courseImg;
    }

    @Override
    public String toString() {
        return "Courses{" + "courseID=" + courseID + ", courseName=" + courseName + ", courseImg=" + courseImg + '}';
    }
   
    
}
