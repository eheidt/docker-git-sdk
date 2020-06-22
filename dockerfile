# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

COPY git-sdk-64 C:\git-sdk-64

SHELL ["cmd", "/S", "/C"]
WORKDIR C:\git-sdk-64
RUN setup-git-sdk.bat
WORKDIR C:\

RUN curl https://nodejs.org/dist/v12.16.2/node-v12.16.2-x64.msi -o c:\nodejs.msi & `
    msiexec /qn /l* C:\node-log.txt /i c:\nodejs.msi

RUN npm config set script-shell C:\git-sdk-64\usr\bin\bash.exe

RUN curl https://cdist2.perforce.com/perforce/r20.1/bin.ntx64/p4.exe -o C:\git-sdk-64\cmd\p4.exe

RUN setx /m path "C:\git-sdk-64\cmd\;C:\git-sdk-64\usr\bin\;%path%"

RUN pacman -S zip --noconfirm

#RUN bash --version
#RUN pacman --version
#RUN git --version
#RUN msbuild /Version
#RUN dotnet --info
#RUN node -v
#RUN npm -v
