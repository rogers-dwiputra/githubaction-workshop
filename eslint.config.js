export default [
    {
      ignores: ["node_modules", "dist"], // Abaikan folder yang tidak perlu dicek
    },
    {
      languageOptions: {
        ecmaVersion: "latest",
        sourceType: "module"
      },
      plugins: {},
      rules: {
        semi: ["error", "always"],
        quotes: ["error", "double"]
      }
    }
  ];
  