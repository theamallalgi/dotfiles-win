#!/bin/bash

# install all pip packages required
install_pip_packages() {
    packages=(
        aiohappyeyeballs aiohttp aiosignal annotated-types anyio attrs black Brotli cachetools certifi cffi charset-normalizer
        click colorama contourpy cryptography cssselect2 cycler Deprecated distro et-xmlfile fake-useragent filelock
        fonttools frozenlist fsspec google-api-core google-api-python-client google-auth google-auth-httplib2
        google-auth-oauthlib googleapis-common-protos h11 html5lib httpcore httplib2 httpx huggingface-hub idna ipaddress
        isort Jinja2 jiter kiwisolver logging mail-parser Markdown MarkupSafe matplotlib mpmath multidict mypy-extensions
        networkx numpy oauthlib openai openpyxl outcome packaging pandas pathspec pdfkit pillow platformdirs proto-plus
        protobuf pyasn1 pyasn1_modules pycparser pydantic pydantic_core pydyf PyGithub PyJWT PyNaCl pypandoc pyparsing pyphen
        PySocks python-dateutil pytz PyYAML regex requests requests-oauthlib rsa safetensors schedule scipy selenium
        setuptools six sniffio sortedcontainers stem sympy tinycss2 tokenizers torch tqdm transformers trio trio-websocket
        typing_extensions tzdata uritemplate urllib3 weasyprint webencodings websocket-client wrapt wsproto yarl zopfli
    )
    
    echo -e "\n[i] total packages to install: ${#packages[@]}"
    
    for package in "${packages[@]}"; do
        echo "[→] Installing $package..."
        pip install "$package"
    done
}

# Ensure pip is installed and up-to-date
ensure_pip_installed

# Install all packages
install_pip_packages

echo -e "\n[*] all pip packages installed."
