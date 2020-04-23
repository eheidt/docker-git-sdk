# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

COPY git-sdk-64 C:\git-sdk-64

SHELL ["cmd", "/S", "/C"]
WORKDIR C:\git-sdk-64
RUN setup-git-sdk.bat
WORKDIR C:\

RUN setx /m path "C:\git-sdk-64\usr\bin\;%path%"

RUN pacman -S zip --noconfirm

RUN bash --version
RUN pacman --version
RUN git --version
RUN msbuild /Version
RUN dotnet --info



#RUN curl https://nodejs.org/dist/v10.15.3/node-v10.15.3-x64.msi -o c:\nodejs.msi & msiexec /qn /l* C:\node-log.txt /i c:\nodejs.msi
#RUN node -v
#RUN npm -v