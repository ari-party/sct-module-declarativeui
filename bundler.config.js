/** @type {import("scribunto-bundler").Config} */
export default {
  prefix: `
-- Code bundled using https://github.com/ari-party/scribunto-bundler
-- Find module source code at https://github.com/ari-party/sct-module-declarativeui
`,

  main: "src/createElement.lua",
  out: "dist/bundled.lua",
};
