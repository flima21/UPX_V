# :camera_flash: CROSS THE LINES
Apresentamos o Cross Line, um aplicativo simples e intuitivo que permite realizar o monitoramento de áreas externas de condomínios e residências de forma automatizada, ao detector uma invasão o Sistema gera alertas em tempo real para o usuário. 

## DESENVOLVEDORES :frowning_man:
* Felipe Pedroso de Lima (211429)
* Jônatas Serna de Souza (211693)

## ALERTA :loudspeaker:
O alerta é verificado a partir de um script em python que se utiliza da biblioteca <a href='https://github.com/flima21/cross-line'>OpenCv</a>, cujo é feita a leitura e exibição de imagens em diversos formatos (como JPG, PNG, BMP, entre outros) e vídeos, possibilitando, por isso, a captura e manipulação tanto em tempo real quanto de arquivos gravados, sendo possível assim o monitoramento das áreas determinadas pelo usuário.

## PROJETO
Neste repositório encontra-se o aplicativo mobile desenvolvido em flutter onde contém a interface amigável para ser utilizada. 

1. RECURSOS
- Firebase 
- OpenCv
- Python
- Flutter
- Dart
- Internet
2. Execução do Projeto 
- Para executar o projeto siga os passos abaixo:
    1. Clone o projeto
        ```
        git clone https://github.com/flima21/UPX_V.git
        ```
        * É de extrema importância que antes da execução deste projeto, o repositório <a href='https://github.com/flima21/cross-line'>CROSS-LINES</a> já esteja clonado em seu ambiente de trabalho
    2. Entre no repositório criado
        ```
        cd UPX_V
        ```
    3. Verifique o ambiente flutter do seu host, caso não esteja instalado, ler a documentação Flutter.
        ```
        flutter doctor
        ```
    4. Instale as dependências do flutter necessárias para execução do projeto
        ```
        flutter pub get
        ```
    5. Após isso execute o projeto com o comando abaixo:
        ```
        flutter run
        ```



