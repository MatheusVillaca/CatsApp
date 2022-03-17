![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg?style=for-the-badge)
![Swift Version](https://img.shields.io/badge/Swift-5.3-orange.svg?style=for-the-badge&logo=swift)
![iOS Version](https://img.shields.io/badge/iOS-14.5+-green.svg?style=for-the-badge) 
![Xcode Version](https://img.shields.io/badge/Xcode-13+-blue.svg?style=for-the-badge)

# CatsApp

Segundo aplicativo desenvolvido por mim, durante meus estudos, onde o intuito foi colocar em prática meus conhecimentos adquiridos ao longo de uma mentoria concedida por um desenvolvedor com vários anos de experiência na área. 

## Tecnologias

O app foi desenvolvido em `Swift`, seguindo a arquitetura `MVC`.

As telas foram desenvolvidas **programaticamente**, implementando o protocolo `ViewCode`, visando assim seguir um padrão.

Foi ultilizado o gerenciador de dependências `CocoaPods` para adicionar as bibliotecas `KingFisher` e `PKHUD`.

A navegação do app foi montada com `UITabBarController`, onde a listagem dos elementos foi feita com `UICollectionView`, e o armazenameto local de favoritos foi implementado ultilizando o `UserDefaults`.

Os dados apresentados foram extraídos de uma [API pública](https://api.thecatapi.com/v1/breeds), onde o `JSON` retornado foi decodificado ultilizando o protocolo `Codable`.

## Desafios

Foi a primeira vez que implementei uma  comunicação com `API`, e montei minha navegação ultilizando `UITabBarController`. Também foi meu primeiro contato com `UICollectionView`, porém, como já havia ultilizado em meu primeiro projeto `UITableView`, não tive grandes dificuldades.

