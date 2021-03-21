Set-Location -Path "C:\AIproject\object-detection-opencv-master\object-detection-opencv-master"
function AI{
$test = Get-Date
$time = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId($test, [System.TimeZoneInfo]::Local.Id, 'India Standard Time')
$d = $time.Day
$m = $time.Month
$y = $time.Year
$hh = $time.Hour
$mm = $time.Minute-1
if($hh -gt "10"){

$h= $hh
$h
}else{
$h = '0'+$hh
$h
}
$date = "$y"+0+"$m"+"$d"
if($mm -gt "10"){

$pdate = "C:\ftp\$date\$h\$mm"
$pdate
}else{
$pdate = "C:\ftp\$date\$h\0$mm"
$pdate
}
function whatapp{
python whatsapp.py
}
function sendmail{
$From = "rsntechnology20@gmail.com"
$To = "iyyappanjj@gmail.com","ejsenthil@gmail.com","selvavoice@gmail.com"
$Cc = "mail2sabarinathan@yahoo.com"
$Attachment = ".\object-detection.jpg"
$Subject = "Alert!! Interuder detection"
$Body = "Intruder has been detected on the camare find the attachment for your reference"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
#$cred = (Get-Credential)
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $cred -Attachments $Attachment
}
$filet = Get-ChildItem -Path $pdate| Sort CreationTime|select name
$file = $filet.name
foreach ($files in $file){
$out =" "
$path =  "$pdate\"+$files
$path
$out = python yolo_opencv.py --image $path --config yolov3.cfg --weights yolov3.weights --classes yolov3.txt
$out
if($out -eq "person"){
sendmail
whatapp
}
}
}
while($true)
{
    AI
}
#Start-Process powershell.exe 'C:\Users\Pocuser\Desktop\AIimagedetection application.ps1'