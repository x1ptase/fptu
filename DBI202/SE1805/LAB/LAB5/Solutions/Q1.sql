/*
Câu 1: Procedure
Viết thủ tục usp_XoaKhachHang nhận vào mã khách hàng (MAKH) và xóa khách hàng đó khỏi bảng KHACHHANG nếu họ không có hóa đơn nào.
*/

CREATE PROC usp_XoaKhachHang
    @MAKH VARCHAR(4)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM HOADON WHERE MAKH=@MAKH)
    BEGIN
        DELETE FROM KHACHHANG WHERE MAKH=@MAKH
    END
END

