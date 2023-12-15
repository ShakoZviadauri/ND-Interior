
![Logo](https://ndinterior.design/storage/ic_launcher.png)


# Welcome to ND Interior

Welcome to ND Interior, a cutting-edge mobile application developed using Flutter and Dart that seamlessly integrates with a Laravel-based API to bring forth an immersive 3D augmented reality experience.

This project combines the power of Flutter and Dart to create a dynamic, cross-platform mobile application. Leveraging the robustness of Laravel, it connects with a robust API to manage and deliver data efficiently.

The highlight of this project is its integration of 3D augmented reality objects, enabling users to experience an interactive and engaging environment like never before.



## Screen

Main Screen             |  Solarized Ocean
:-------------------------:|:-------------------------:
![](https://ndinterior.design/storage/Screenshot_20231215_175122-portrait.png)  |  ![](https://ndinterior.design/storage/Screenshot_20231215_175128-portrait.png)  |  ![](https://ndinterior.design/storage/Screenshot_20231215_175141-portrait.png)  |  ![](https://ndinterior.design/storage/Screenshot_20231215_175157-portrait.png)





## API Reference

#### Get all items

```http
  POST /api/3dmodels/carusel/last
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  POST /api/3dmodelsdetail/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |



## Authors

- [@ShakoZviadauri](https://github.com/ShakoZviadauri)


## Clone Repository

Clone the project

```bash
  git clone https://github.com/ShakoZviadauri/ND-Interior.git
```



## Run Locally

Clone the project

```bash
  git clone https://github.com/ShakoZviadauri/ND-Interior.git
```

Go to the project directory

```bash
  cd ND-Interior
```

Install dependencies

```bash
   flutter pub get
```

Start the server

```bash
    flutter run
```


## Features

- Light/dark mode toggle
- Live previews
- Fullscreen mode
- Cross platform
- Localization

