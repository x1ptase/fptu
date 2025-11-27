/*
Câu 2: Procedure
Viết thủ tục CapNhatGiaSanPham nhận vào mã sản phẩm (MASP) và giá mới, sau đó cập nhật giá trong bảng SANPHAM.
*/

CREATE PROC CapNhatGiaSanPham
	@MASP VARCHAR(4),
	@GIA DECIMAL(15,0)
AS
BEGIN
		UPDATE SANPHAM
		SET GIA=@GIA
		WHERE MASP=@MASP
END
