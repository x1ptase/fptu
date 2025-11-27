/*
Câu 1: Procedure
Viết thủ tục usp_XoaKhachHang nhận vào mã khách hàng (MAKH) và xóa khách hàng đó khỏi bảng KHACHHANG nếu họ không có hóa đơn nào.

Câu 2: Procedure
Viết thủ tục CapNhatGiaSanPham nhận vào mã sản phẩm (MASP) và giá mới, sau đó cập nhật giá trong bảng SANPHAM.

Câu 3: Function
Viết một hàm fn_TinhTongDoanhSoKH nhận vào mã khách hàng (MAKH) và trả về tổng doanh số của khách hàng đó tính từ bảng HOADON

Câu 4: Function
Tạo một function fn_TongSoLuongSPDaBan nhận vào mã sản phẩm (MASP) và trả về tổng số lượng sản phẩm đó đã bán được từ bảng CTHD.
*/

--Q1
CREATE PROC usp_XoaKhachHang
    @MAKH VARCHAR(4)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM HOADON WHERE MAKH=@MAKH)
    BEGIN
        DELETE FROM KHACHHANG WHERE MAKH=@MAKH
    END
END

--Q2
CREATE PROC CapNhatGiaSanPham
	@MASP VARCHAR(4),
	@GIA DECIMAL(15,0)
AS
BEGIN
		UPDATE SANPHAM
		SET GIA=@GIA
		WHERE MASP=@MASP
END

--Q3
CREATE FUNCTION fn_TinhTongDoanhSoKH(
	@MAKH VARCHAR(4)
)
RETURNS DECIMAL(15,0)
AS
BEGIN
	DECLARE @TongDoanhSo DECIMAL(15,0)
	SELECT @TongDoanhSo=SUM(TRIGIA)
	FROM HOADON
	WHERE MAKH=@MAKH
	RETURN ISNULL(@TongDoanhSo, 0)
END

--Q4
CREATE FUNCTION fn_TongSoLuongSPDaBan
(
    @MASP VARCHAR(4)
)
RETURNS INT
AS
BEGIN
    DECLARE @TongSoLuong INT
    SELECT @TongSoLuong=SUM(SL)
    FROM CTHD
    WHERE MASP=@MASP
    RETURN ISNULL(@TongSoLuong, 0)
END