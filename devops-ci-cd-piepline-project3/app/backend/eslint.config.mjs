import js from "@eslint/js";
import globals from "globals";
import { defineConfig } from "eslint/config";

export default defineConfig([
  {
    files: ["**/*.{js,mjs,cjs}"],
    languageOptions: {
      ecmaVersion: "latest",
    },
    plugins: { js },
    extends: ["js/recommended"],
  },
  {
    files: ["**/*.js"], // ← match all JS files in the current folder
    languageOptions: {
      globals: globals.node,
    },
  },
]);
