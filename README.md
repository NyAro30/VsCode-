# 🖥️ 42 Goinfre Setup

Script d'initialisation automatique pour les postes de l'école **42**.  
Recrée les liens symboliques vers `goinfre` et réinstalle les extensions VS Code à chaque connexion sur un nouveau poste.

---

## ⚡ Installation rapide

```bash
curl -fsSL https://raw.githubusercontent.com/<username>/<repo>/main/setup_goinfre.sh | bash
```

> Remplacez `<username>` et `<repo>` par vos informations GitHub.

---

## 🔧 Ce que fait le script

- 📁 Crée les dossiers nécessaires dans `~/goinfre`
- 🔗 Recrée les liens symboliques :
  - `~/.vscode` → `~/goinfre/.vscode`
  - `~/.config/Code` → `~/goinfre/.config/Code`
  - `~/.var` → `~/goinfre/.var`
- 🔌 Vérifie et réinstalle les extensions VS Code manquantes

---

## 🔄 Automatisation au démarrage

Pour que le script se lance automatiquement à chaque ouverture de terminal, ajoutez-le à votre `.zshrc` :

```bash
echo '\nbash ~/setup_goinfre.sh' >> ~/.zshrc
```

---

## 🧩 Extensions installées

| Extension | Description |
|-----------|-------------|
| `daltonmenezes.aura-theme` | Thème Aura |
| `dokca.42-ft-count-line` | Compteur de lignes 42 |
| `github.copilot` | GitHub Copilot |
| `github.copilot-chat` | GitHub Copilot Chat |
| `kube.42header` | Header 42 |
| `ms-python.debugpy` | Debugger Python |
| `ms-python.python` | Support Python |
| `ms-python.vscode-pylance` | Pylance |
| `ms-python.vscode-python-envs` | Environnements Python |
| `ms-vscode.cmake-tools` | CMake Tools |
| `ms-vscode.cpp-devtools` | C++ DevTools |
| `ms-vscode.cpptools` | C/C++ |
| `ms-vscode.cpptools-extension-pack` | C/C++ Extension Pack |
| `ms-vscode.cpptools-themes` | C/C++ Themes |
| `ms-vscode.makefile-tools` | Makefile Tools |
| `pkief.material-icon-theme` | Material Icon Theme |
| `seyyedkhandon.firacode` | FiraCode Font |

---

## ⚠️ Pourquoi goinfre ?

À 42, le quota du home (`~`) est très limité. `goinfre` est un espace local à chaque machine avec plus de stockage, mais il est **réinitialisé à chaque changement de poste**. Ce script permet de tout reconfigurer en une seule commande.

---

## 📝 Ajouter une extension

1. Installez l'extension dans VS Code
2. Ajoutez son identifiant dans le tableau `EXTENSIONS` du script `setup_goinfre.sh`
3. Faites un `git push`

```bash
code --list-extensions  # Pour voir les identifiants de vos extensions
```
