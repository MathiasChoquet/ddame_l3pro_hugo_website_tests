@echo off
powershell -ExecutionPolicy Bypass -Command ^
"function dl($url, $dir) { ^
    New-Item -ItemType Directory -Force -Path $dir | Out-Null; ^
    $r = Invoke-WebRequest -Uri $url -MaximumRedirection 10; ^
    $cd = $r.Headers['Content-Disposition']; ^
    if ($cd -match 'filename=""?([^"";]+)""?') { $f = $matches[1].Trim() } ^
    else { $f = [IO.Path]::GetFileName($r.BaseResponse.ResponseUri.LocalPath) }; ^
    $dest = Join-Path $dir $f; ^
    if (Test-Path $dest) { Write-Host ('Skipping ' + $f) } ^
    else { Write-Host ('Downloading ' + $f); [IO.File]::WriteAllBytes($dest, $r.Content) } ^
}; ^
$b = '%~dp0'; ^
dl 'https://unsplash.com/photos/wRuhOOaG-Z4/download?&force=true&w=1920' ($b+'content'); ^
dl 'https://unsplash.com/photos/UC1pzyJFyvs/download?&force=true&w=1920' ($b+'content\animals'); ^
dl 'https://unsplash.com/photos/gKXKBY-C-Dk/download?force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/75715CVEJhI/download?force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/mJaD10XeD7w/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/CEx86maLUSc/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/yMSecCHsIBc/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/rW-I87aPY5Y/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/p6yH8VmGqxo/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/LEpfefQf4rU/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/nKC772R_qog/download?&force=true&w=1920' ($b+'content\animals\cats'); ^
dl 'https://unsplash.com/photos/Sg3XwuEpybU/download?&force=true&w=1920' ($b+'content\animals\dogs'); ^
dl 'https://unsplash.com/photos/Mv9hjnEUHR4/download?&force=true&w=1920' ($b+'content\animals\dogs'); ^
dl 'https://unsplash.com/photos/2l0CWTpcChI/download?&force=true&w=1920' ($b+'content\animals\dogs'); ^
dl 'https://unsplash.com/photos/WX4i1Jq_o0Y/download?&force=true&w=1920' ($b+'content\animals\dogs'); ^
dl 'https://unsplash.com/photos/FkxXePJJH5g/download?force=true&w=1920' ($b+'content\fashion-beauty'); ^
dl 'https://unsplash.com/photos/63obHScZWZw/download?&force=true&w=1920' ($b+'content\fashion-beauty'); ^
dl 'https://unsplash.com/photos/7gqnlnCTvlg/download?&force=true&w=1920' ($b+'content\fashion-beauty'); ^
dl 'https://unsplash.com/photos/V94CguEmeos/download?&force=true&w=1920' ($b+'content\fashion-beauty'); ^
dl 'https://unsplash.com/photos/ZS_XuDZmxpM/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/U7BG3FOT5r8/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/TUzsO59UFpo/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/P45gR9kH0SM/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/k_PbdrEs79g/download?force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/4f8u5mFGKjw/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/f_C_lFxqThI/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/x7CyIC2jUaE/download?&force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/RuaRTaKi-D4/download?force=true&w=1920' ($b+'content\nature'); ^
dl 'https://unsplash.com/photos/gRknIewfaBs/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/QQ0naV2n-mg/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/_lQgFjsTgEs/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/7pYqHNp37Pg/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/6dH1__uRYtg/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/t2WImwH1Fa0/download?force=true&w=1920' ($b+'content\private'); ^
dl 'https://unsplash.com/photos/fcwZsjyqp0s/download?force=true&w=1920' ($b+'content\featured-album'); ^
dl 'https://unsplash.com/photos/IFlBNNOLHUo/download?force=true&w=1920' ($b+'content\featured-album'); ^
dl 'https://unsplash.com/photos/pjszS6Q2g_Y/download?force=true&w=1920' ($b+'content\featured-album'); ^
Write-Host 'Done!'"
pause
