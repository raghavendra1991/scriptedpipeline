#!/bin/bash
# CNTLM Proxy settings
export http_proxy=http://127.0.0.1:3128/
export https_proxy=http://127.0.0.1:3128/
export ftp_proxy=http://127.0.0.1:3128/
export socks_proxy=socks://127.0.0.1:3128/
curl google.de
