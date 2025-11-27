/*
Câu 3: Function
Viết một hàm fn_TinhTongDoanhSoKH nhận vào mã khách hàng (MAKH) và trả về tổng doanh số của khách hàng đó tính từ bảng HOADON
*/

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
