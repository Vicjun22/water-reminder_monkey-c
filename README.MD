# Water Reminder (Connect IQ)

Este repositório contém uma implementação do **Lembrete de Água** para dispositivos Garmin, desenvolvida em **Monkey C** puro, com foco no aprendizado de conceitos fundamentais da plataforma: Views, Delegates, persistência de dados (Storage), desenho customizado para tela redonda e vibração nativa.

Projeto criado especialmente para o **Garmin Forerunner 265 Music** (compatível também com outros modelos redondos do ecossistema).

## Objetivo

O objetivo deste projeto é consolidar os conhecimentos adquiridos no desenvolvimento para o ecossistema Garmin Connect IQ através da construção de um aplicativo completo de acompanhamento de hidratação, replicando o funcionamento de apps famosos de lembrete de água, mas com uma interface desenhada sob medida para a tela circular do relógio.

## Funcionalidades

- Interface customizada (cabeçalho azul, barra de progresso e menu com scroll)
- Registro de consumo diário de água (ml)
- Metas de consumo configuráveis (passo de 100 em 100 ml)
- Cálculo de necessidade diária baseada no peso corporal (peso × 35 ml)
- Menu de configurações interno (Notificar, Idioma, Limpar Progresso, Versão do App)
- Reset de progresso com animação de borda e vibração (segurar START por 2s)
- Reset automático do consumo diário à meia-noite
- Persistência de dados locais (meta e histórico do dia sobrevivem ao fechamento do app)

## Tecnologias

| Tecnologia     | Versão     | Documentação                                      |
| -------------- | ---------- | ------------------------------------------------- |
| Monkey C       | SDK 9.3.0  | [Connect IQ Docs](https://developer.garmin.com/connect-iq/) |
| VS Code        | Última     | [VS Code Docs](https://code.visualstudio.com/docs) |
| Connect IQ SDK | 9.3.0      | [SDK Download](https://developer.garmin.com/connect-iq/sdk/) |

## Desenvolvimento

### Primeiros Passos:

Para iniciar o desenvolvimento, certifique-se de ter o **VS Code** instalado e a extensão oficial **Monkey C** da Garmin configurada com o SDK baixado. Em seguida:

1. Abra a pasta do projeto no VS Code.
2. Pressione `F5` para compilar e rodar no simulador do **Forerunner 265**.

Para testar no relógio físico, utilize `Ctrl+Shift+P` → `Monkey C: Build for Device`.

### Estrutura do Projeto

```text
source/
├── WaterApp.mc              # Ponto de entrada do aplicativo
├── WaterView.mc             # Tela principal (menu, progresso)
├── WaterDelegate.mc         # Controle de navegação principal
├── AddWaterView.mc          # Tela de adicionar água
├── AddWaterDelegate.mc      # Lógica de adicionar água
├── GoalView.mc              # Tela de ajustar meta
├── GoalDelegate.mc          # Lógica de ajustar meta
├── CalcView.mc              # Tela de cálculo por peso
├── CalcDelegate.mc          # Lógica de cálculo
├── SettingsView.mc          # Tela de configurações (menu)
├── SettingsDelegate.mc      # Lógica de navegação das configurações
├── NotifyView.mc            # Tela de notificações (Em Breve)
├── NotifyDelegate.mc        # Lógica de notificações
├── LanguageView.mc          # Tela de idioma (Português - Brasil)
├── LanguageDelegate.mc      # Lógica de idioma
├── ResetProgressView.mc     # Tela de confirmação de reset
├── ResetProgressDelegate.mc # Lógica de reset com hold e vibração
├── VersionsView.mc          # Tela de versão do app
├── VersionsDelegate.mc      # Lógica da tela de versão
├── SuccessView.mc           # Tela de sucesso após ações
├── SuccessDelegate.mc       # Lógica de retorno automático da tela de sucesso
└── DataManager.mc           # Persistência de dados (Storage) e lógica diária
```

## Versão 1.0

A versão **1.0** do Water Reminder é a versão principal e já está funcional. Ela contempla o núcleo do aplicativo, os menus de navegação e as telas auxiliares.

### Funcionalidades implementadas

- [x] Menu principal com scroll suave e indicadores visuais
- [x] Destaque visual do item selecionado (fundo azul no menu principal e no menu de configurações)
- [x] Registro diário de água com incrementos pré-definidos (500, 250, 100, 50 e 35 ml)
- [x] Definição de meta diária de consumo (100 a 5000 ml, com passo de 100 ml)
- [x] Cálculo automático da necessidade de água com base no peso corporal (peso × 35 ml)
- [x] Barra de progresso visual no cabeçalho da tela principal
- [x] Reset automático do progresso ao virar o dia (baseado em `Time.today().value()`, evitando problemas de locale)
- [x] Tela de confirmação de "Limpar Progresso" com animação de borda circular e vibração ao segurar o botão START por 2 segundos
- [x] Cancelamento do reset ao soltar o botão antes do tempo (via `onRelease`)
- [x] Menu de configurações com 4 opções: **Notificar**, **Idioma**, **Limpar Progresso** e **Versão do App**
- [x] Tela de versão exibindo "Versão 1.0" e descrição com quebra automática de texto (`Graphics.fitTextToArea`)
- [x] Tela de idioma exibindo "Português - Brasil" (placeholder para a futura troca real de idioma)
- [x] Persistência de dados entre execuções do app (`Toybox.Application.Storage`)
- [x] Tratamento de configuração inicial (valores padrão caso o Storage esteja vazio)
- [x] Feedback visual com tela "Salvo!" (2 segundos) ao confirmar meta ou cálculo por peso
- [x] Saída do aplicativo pelo menu principal ("Sair" via `System.exit()`)

### Pendências para versões futuras

- [ ] Ícone de launcher customizado (60x60 para o relógio e 500x500 para a Connect IQ Store)
- [ ] Substituição dos textos hardcoded por recursos de tradução (`strings.xml` + `resources-por`)
- [ ] Testes em dispositivos físicos além do simulador

## Versão 1.1 (Previsão)

A versão **1.1** está prevista e focará nas funcionalidades de **notificação** e **engajamento**, que hoje aparecem como "Em Breve" no submenu de configurações.

### Notificações e Lembretes

- [ ] **Notificação de meta atingida**: vibrar e/ou emitir som breve no relógio quando o usuário atingir 100% da meta diária de água
- [ ] **Notificações periódicas de lembrete**: configurar um intervalo de tempo (ex: a cada 1 hora) para o relógio vibrar lembrando o usuário de beber água
- [ ] **Notificação de progresso diário**: escolher um horário fixo (ex: 20:00) para receber o resumo do dia ("Você ingeriu hoje: X% da meta!")
- [ ] **Tela de Notificação real**: substituir o "Em Breve" da `NotifyView` por controles de ativação/desativação, seleção de horário e teste de vibração

### Internacionalização

- [ ] **Seleção de idioma**: implementar a troca efetiva entre Português, Inglês e outros idiomas na `LanguageView`
- [ ] **Arquivos de tradução**: criar `resources-por/strings.xml`, `resources-eng/strings.xml` e carregar via `WatchUi.loadResource()`
- [ ] **Menu principal traduzido**: substituir o array `menuItems` hardcoded na `WaterView` por leitura dinâmica do `strings.xml`

### Identidade Visual e Publicação

- [ ] **Ícone de launcher**: criar o ícone 60x60 para o relógio e 500x500 para a Connect IQ Store
- [ ] **Splash screen** (opcional): adicionar uma tela inicial com a marca do app antes do menu principal
- [ ] **Publicação na Connect IQ Store**: gerar o pacote `.iq` via `Monkey C: Export Project` e submeter ao Developer Dashboard da Garmin

## Contribuição

Fique à vontade para abrir `issues` com sugestões, melhorias ou reportar erros. Você também pode abrir um `Pull Request` com contribuições.

## Contato

Para mais informações ou dúvidas, entre em contato:

- **Email:** vicjun22@gmail.com
- **LinkedIn:** [Victor Elias Ross Jr.](https://www.linkedin.com/in/victor-elias-ross-jr/)

---

Espero que este projeto ajude no seu aprendizado em Monkey C e no desenvolvimento para o ecossistema Garmin Connect IQ!

Atenciosamente,  
**Victor**