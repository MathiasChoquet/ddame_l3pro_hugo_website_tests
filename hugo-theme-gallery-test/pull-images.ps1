$ErrorActionPreference = "Stop"

function Download-Image($url, $dir) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $response = Invoke-WebRequest -Uri $url -Method Get -MaximumRedirection 10
    # Get filename from Content-Disposition header
    $cd = $response.Headers["Content-Disposition"]
    if ($cd -match 'filename="?([^";\r\n]+)"?') {
        $filename = $matches[1].Trim()
    } else {
        # Fallback: use the final URL's filename
        $filename = [System.IO.Path]::GetFileName($response.BaseResponse.ResponseUri.LocalPath)
    }
    $dest = Join-Path $dir $filename
    if (Test-Path $dest) {
        Write-Host "Skipping $filename (already exists)"
    } else {
        Write-Host "Downloading $filename -> $dir"
        [System.IO.File]::WriteAllBytes($dest, $response.Content)
    }
}

$base = Split-Path -Parent $MyInvocation.MyCommand.Path

# Home
Download-Image "https://unsplash.com/photos/wRuhOOaG-Z4/download?&force=true&w=1920" "$base\content"

# Animals
Download-Image "https://unsplash.com/photos/UC1pzyJFyvs/download?&force=true&w=1920" "$base\content\animals"

# Animals/Cats
Download-Image "https://unsplash.com/photos/gKXKBY-C-Dk/download?force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/75715CVEJhI/download?force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/mJaD10XeD7w/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/CEx86maLUSc/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/yMSecCHsIBc/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/rW-I87aPY5Y/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/p6yH8VmGqxo/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/LEpfefQf4rU/download?&force=true&w=1920" "$base\content\animals\cats"
Download-Image "https://unsplash.com/photos/nKC772R_qog/download?&force=true&w=1920" "$base\content\animals\cats"

# Animals/Dogs
Download-Image "https://unsplash.com/photos/Sg3XwuEpybU/download?&force=true&w=1920" "$base\content\animals\dogs"
Download-Image "https://unsplash.com/photos/Mv9hjnEUHR4/download?&force=true&w=1920" "$base\content\animals\dogs"
Download-Image "https://unsplash.com/photos/2l0CWTpcChI/download?&force=true&w=1920" "$base\content\animals\dogs"
Download-Image "https://unsplash.com/photos/WX4i1Jq_o0Y/download?&force=true&w=1920" "$base\content\animals\dogs"

# Fashion & Beauty
Download-Image "https://unsplash.com/photos/FkxXePJJH5g/download?force=true&w=1920" "$base\content\fashion-beauty"
Download-Image "https://unsplash.com/photos/63obHScZWZw/download?&force=true&w=1920" "$base\content\fashion-beauty"
Download-Image "https://unsplash.com/photos/7gqnlnCTvlg/download?&force=true&w=1920" "$base\content\fashion-beauty"
Download-Image "https://unsplash.com/photos/V94CguEmeos/download?&force=true&w=1920" "$base\content\fashion-beauty"

# Nature
Download-Image "https://unsplash.com/photos/ZS_XuDZmxpM/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/U7BG3FOT5r8/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/TUzsO59UFpo/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/P45gR9kH0SM/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/k_PbdrEs79g/download?force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/4f8u5mFGKjw/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/f_C_lFxqThI/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/x7CyIC2jUaE/download?&force=true&w=1920" "$base\content\nature"
Download-Image "https://unsplash.com/photos/RuaRTaKi-D4/download?force=true&w=1920" "$base\content\nature"

# Private
Download-Image "https://unsplash.com/photos/gRknIewfaBs/download?force=true&w=1920" "$base\content\private"
Download-Image "https://unsplash.com/photos/QQ0naV2n-mg/download?force=true&w=1920" "$base\content\private"
Download-Image "https://unsplash.com/photos/_lQgFjsTgEs/download?force=true&w=1920" "$base\content\private"
Download-Image "https://unsplash.com/photos/7pYqHNp37Pg/download?force=true&w=1920" "$base\content\private"
Download-Image "https://unsplash.com/photos/6dH1__uRYtg/download?force=true&w=1920" "$base\content\private"
Download-Image "https://unsplash.com/photos/t2WImwH1Fa0/download?force=true&w=1920" "$base\content\private"

# Featured
Download-Image "https://unsplash.com/photos/fcwZsjyqp0s/download?force=true&w=1920" "$base\content\featured-album"
Download-Image "https://unsplash.com/photos/IFlBNNOLHUo/download?force=true&w=1920" "$base\content\featured-album"
Download-Image "https://unsplash.com/photos/pjszS6Q2g_Y/download?force=true&w=1920" "$base\content\featured-album"

Write-Host "`nDone!"
