package edu.avocado.dto;

public class Lecture {

    private int lno;
    private String lname;
    private String lteacher;
    private String lexplain;
    private String filePath;
    private String category;
    private int likes;

    public int getLno() {
        return lno;
    }

    public void setLno(int lno) {
        this.lno = lno;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getLteacher() {
        return lteacher;
    }

    public void setLteacher(String lteacher) {
        this.lteacher = lteacher;
    }

    public String getLexplain() {
        return lexplain;
    }

    public void setLexplain(String lexplain) {
        this.lexplain = lexplain;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Lecture{" +
                "lno=" + lno +
                ", lname='" + lname + '\'' +
                ", lteacher='" + lteacher + '\'' +
                ", lexplain='" + lexplain + '\'' +
                ", filePath='" + filePath + '\'' +
                ", category='" + category + '\'' +
                ", likes=" + likes +
                '}';
    }
}
