FROM alfreadx/winehq:winehq1.9.11
MAINTAINER Arpit Nagar <arpitgold@gmail.com>

# Wget is needed by winetricks
RUN apt-get update
RUN apt-get install wget

# Wine really doesn't like to be run as root, so let's set up a non-root
# environment
RUN useradd -d /home/wix -m -s /bin/bash wix
USER wix
ENV HOME /home/wix
ENV WINEPREFIX /home/wix/.wine
ENV WINEARCH win32

# Install .NET Framework 4.0
RUN wine wineboot && xvfb-run winetricks --unattended dotnet40 corefonts
