/*
Câu 4: Function
Tạo một function fn_TongSoLuongSPDaBan nhận vào mã sản phẩm (MASP) và trả về tổng số lượng sản phẩm đó đã bán được từ bảng CTHD.
*/
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


































CREATE FUNCTION fn_TongSoLuongSPDaBan
(
    @MASP varchar(4)
)
RETURNS int
AS
BEGIN
    DECLARE @TongSoLuong int
    SELECT @TongSoLuong = SUM(SL)
    FROM CTHD
    WHERE MASP = @MASP
    RETURN ISNULL(@TongSoLuong, 0)
END