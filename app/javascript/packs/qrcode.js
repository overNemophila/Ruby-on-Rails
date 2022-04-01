import QRCode from 'qrcode'

$(".qrcode").each(function() {
  let content = $(this).data("content");
  let width = $(this).width()
  console.log(width)
  QRCode.toCanvas($(this)[0], content, { width: width });
});
