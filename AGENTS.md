# AGENTS.md

## Descripción del Proyecto

Sitio web estático de documentación construido con [MkDocs](https://www.mkdocs.org/) y el tema [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). Contiene una recopilación curada de recursos de desarrollo (herramientas, emuladores, tutoriales) para plataformas de videojuegos retro y modernas. Todo el contenido está escrito en **español**.

## Stack Tecnológico

- **Contenido:** Ficheros Markdown en `docs/`
- **Generador del sitio:** MkDocs (Python)
- **Tema:** Material for MkDocs (imagen Docker `squidfunk/mkdocs-material:9`)
- **Despliegue:** GitLab Pages mediante `.gitlab-ci.yml`
- **Docker:** OrbStack en macOS

## Comandos

```bash
make run          # Servidor local en http://localhost:8000 (recarga en vivo)
make build        # Generar el sitio estático en el directorio site/
make check_links  # Comprobar enlaces rotos en el sitio desplegado
```

## Despliegue

El despliegue es **automático**. Al hacer push al repositorio en GitLab, se ejecuta una pipeline CI (definida en `.gitlab-ci.yml`) que instala `mkdocs-material`, genera el sitio y lo publica automáticamente en **GitLab Pages**.

- **URL del sitio publicado:** https://recursos.compilersoft.es/
- **Rama de despliegue:** `master` (rama por defecto)
- **No hay validaciones pre-despliegue:** la pipeline solo construye el sitio, no ejecuta tests ni comprobaciones de calidad.

## Estructura del Proyecto

```
docs/
  index.md              # Índice principal / tabla de contenidos
  <Plataforma>.md       # Páginas de recursos por plataforma (PascalCase)
  Desarrollo.md         # Herramientas de desarrollo multiplataforma
  Diseno.md             # Recursos de diseño
  Graficos.md           # Herramientas gráficas
  Sonido.md             # Trackers y recursos de sonido
  TFG.md                # Trabajos de fin de grado
  assets/
    logos/              # Logos PNG de plataformas (nombres en kebab-case)
```

## Convenciones de Contenido

- Cada fichero `.md` tiene **un solo título H1** (`# Nombre de Plataforma`)
- Las páginas de plataforma incluyen un logo: `![PlatformName](assets/logos/slug.png)`
- El contenido se organiza bajo categorías en **H2** (`##`): Emuladores, Herramientas, Tutoriales, Enlaces, etc.
- Las entradas individuales son **H3** (`###`) con el nombre de la herramienta, seguido de una URL en línea sola, y después un párrafo de descripción
- Los nombres de fichero usan PascalCase para plataformas (p. ej., `Commodore64.md`, `NintendoGameBoy.md`) y title-case en español para categorías genéricas (p. ej., `Desarrollo.md`, `Sonido.md`)
- Los ficheros de logo usan kebab-case (p. ej., `commodore-64.png`)
- La extensión `pymdownx.magiclink` está habilitada — las URLs se enlazan automáticamente

## Formato Markdown

- Usar la sintaxis de `pymdownx.magiclink` para enlazar (las URLs en línea se enlazan solas)
- Mantener el contenido en español siempre que sea posible
- Las descripciones de herramientas pueden citar el texto original en inglés si no existe traducción

## Convenciones Git

- Ramas: `master` (por defecto), ramas de feature prefijadas con `feature/`
- Mensajes de commit: estilo conventional-commit — `feat:`, `fix:` seguido de una descripción breve
- Remoto: espejo en GitHub y GitLab

## Notas

- No existen tests automatizados, linting ni validación en CI
- El directorio `site/` es un artefacto de compilación (en `.gitignore`)
- La pipeline de CI solo construye el sitio, sin comprobaciones pre-despliegue
