package dto; // Hoặc com.yourpackage.dto

import java.io.Serializable;

// DTO này dùng để chứa dữ liệu thô từ CSV để hiển thị
public class SurveyDTO implements Serializable {

    // 7 cột trong file gen_z_survey_final.csv
    private String gioiTinh;
    private int doTuoi;
    private String linhVuc;
    private double soNamLamViec;
    private int mucLuong;
    private int soCongViec;
    private String liDo;

    public SurveyDTO() {
    }

    // Getters and Setters
    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public int getDoTuoi() {
        return doTuoi;
    }

    public void setDoTuoi(int doTuoi) {
        this.doTuoi = doTuoi;
    }

    public String getLinhVuc() {
        return linhVuc;
    }

    public void setLinhVuc(String linhVuc) {
        this.linhVuc = linhVuc;
    }

    public double getSoNamLamViec() {
        return soNamLamViec;
    }

    public void setSoNamLamViec(double soNamLamViec) {
        this.soNamLamViec = soNamLamViec;
    }

    public int getMucLuong() {
        return mucLuong;
    }

    public void setMucLuong(int mucLuong) {
        this.mucLuong = mucLuong;
    }

    public int getSoCongViec() {
        return soCongViec;
    }

    public void setSoCongViec(int soCongViec) {
        this.soCongViec = soCongViec;
    }

    public String getLiDo() {
        return liDo;
    }

    public void setLiDo(String liDo) {
        this.liDo = liDo;
    }
}