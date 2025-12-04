public class Course {
    private String courseName;
    private int semester; // [1-9]
    private String campus; // [HN HCM DN QN CT]
    private int credit;

    public Course(String courseName, String campus) {
        this.courseName = courseName;
        this.campus = campus;
    }

    public Course(String courseName, int semester, String campus) {
        this.courseName = courseName;
        this.semester = semester;
        this.campus = campus;
    }

    public Course(String courseName, int semester, String campus, int credit) {
        this.courseName = courseName;
        this.semester = semester;
        this.campus = campus;
        this.credit = credit;
    }

    public Course(String courseName, String campus, int credit) {
        this.courseName = courseName;
        this.campus = campus;
        this.credit = credit;
    }
    
    
    
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "Course{" + "courseName=" + courseName + ", semester=" + semester + ", campus=" + campus + ", credit=" + credit + '}';
    }
}

