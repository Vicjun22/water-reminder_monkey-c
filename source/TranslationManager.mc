import Toybox.Lang;
import Toybox.System;

class TranslationManager {

    static function getLanguage() {
        var lang = DataManager.getSavedLanguage();
        
        var por = lang.equals("por");
        var eng = lang.equals("eng");

        if (lang == null || (!por && !eng)) {
            return "por";
        }

        return lang;
    }

    static function get(key) {
        if (getLanguage().equals("por")) {
            return getPor(key);
        }
        return getEng(key);
    }

    static function getPor(key) {
        if (key == :appName) {
            return "Water Reminder";
        } else if (key == :menuAddWater) {
            return "Adicionar água";
        } else if (key == :menuGoal) {
            return "Ajustar meta";
        } else if (key == :menuCalc) {
            return "Cálculo por peso";
        } else if (key == :menuSettings) {
            return "Configurações";
        } else if (key == :menuExit) {
            return "Sair";
        } else if (key == :useUpDown) {
            return "Use UP/DOWN";
        } else if (key == :daysStreak) {
            return "0 dias seguidos";
        } else if (key == :language) {
            return "Idioma";
        } else if (key == :settings) {
            return "Configurações";
        } else if (key == :progressFormat) {
            return "$1$ml de $2$ml";
        } else if (key == :goal) {
            return "Meta: $1$ml";
        } else if (key == :weight) {
            return "Peso: $1$kg";
        } else if (key == :notifications) {
            return "Notificações";
        } else if (key == :resetProgress) {
            return "Limpar progresso";
        } else if (key == :appVersion) {
            return "Versão do app";
        } else if (key == :background) {
            return "Plano de fundo";
        } else if (key == :customized) {
            return "Personalizado";
        } else if (key == :start) {
            return "Início";
        } else if (key == :end) {
            return "Fim";
        } else if (key == :interval) {
            return "Intervalo";
        } else {
            return "";
        }
    }

    static function getEng(key) {
        if (key == :appName) {
            return "Water Reminder";
        } else if (key == :menuAddWater) {
            return "Add water";
        } else if (key == :menuGoal) {
            return "Adjust goal";
        } else if (key == :menuCalc) {
            return "Weight calc";
        } else if (key == :menuSettings) {
            return "Settings";
        } else if (key == :menuExit) {
            return "Exit";
        } else if (key == :useUpDown) {
            return "Use UP/DOWN";
        } else if (key == :daysStreak) {
            return "0 days streak";
        } else if (key == :language) {
            return "Language";
        } else if (key == :settings) {
            return "Settings";
        } else if (key == :progressFormat) {
            return "$1$ml of $2$ml";
        } else if (key == :goal) {
            return "Goal: $1$ml";
        } else if (key == :weight) {
            return "Weight: $1$kg";
        } else if (key == :notifications) {
            return "Notifications";
        } else if (key == :resetProgress) {
            return "Reset progress";
        } else if (key == :appVersion) {
            return "App version";
        } else if (key == :background) {
            return "Background";
        } else if (key == :customized) {
            return "Customized";
        } else if (key == :start) {
            return "Start";
        } else if (key == :end) {
            return "End";
        } else if (key == :interval) {
            return "Interval";
        } else {
            return "";
        }
    }
}
