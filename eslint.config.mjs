import globals from "globals";
import pluginJs from "@eslint/js";
/** @type {import('eslint').Linter.Config[]} */
export default [
  {
    languageOptions: {
      globals: { ...globals.browser, ...globals.node },
      parserOptions: {
        ecmaVersion: 2021, // ou la version ECMAScript que tu souhaites utiliser
        sourceType: "module", // si tu utilises des modules ES
      },
    },
    rules: {
      "no-unused-vars": "warn", // avertir sur les variables non utilisées
      "eqeqeq": ["error", "always"], // forcer l'utilisation de === et !==
      "semi": ["error", "always"], // exiger un point-virgule à la fin des lignes
      "quotes": ["error", "single"], // exiger l'utilisation de guillemets simples
      // Ajoute d'autres règles selon tes besoins
    },
  },
  pluginJs.configs.recommended,
];