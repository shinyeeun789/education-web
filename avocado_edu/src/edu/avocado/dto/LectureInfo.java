package edu.avocado.dto;

public class LectureInfo {

    private int dno;
    private int lno;
    private String title;
    private String filePath;
    private String duration;

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    public int getLno() {
        return lno;
    }

    public void setLno(int lno) {
        this.lno = lno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "LectureInfo{" +
                "dno=" + dno +
                ", lno=" + lno +
                ", title='" + title + '\'' +
                ", filePath='" + filePath + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }
}
