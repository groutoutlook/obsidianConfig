/*
THIS IS A GENERATED/BUNDLED FILE BY ESBUILD
if you want to view the source, please visit the github repository of this plugin
*/

var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/main.ts
var main_exports = {};
__export(main_exports, {
  default: () => main_default
});
module.exports = __toCommonJS(main_exports);

// src/SnippetManagerPlugin.ts
var import_obsidian3 = require("obsidian");

// src/SnippetSuggestModal.ts
var import_obsidian = require("obsidian");
var SnippetSuggestModal = class extends import_obsidian.FuzzySuggestModal {
  constructor(app, plugin, editor) {
    super(app);
    this.items = {};
    this.plugin = plugin;
    this.editor = editor;
    this.refreshSnippets();
    this.scope.register(["Mod"], "Enter", (evt) => {
      if (evt.isComposing) {
        return;
      }
      this.chooser.useSelectedItem(evt);
      return false;
    });
    this.setPlaceholder("Search snippets...");
  }
  async refreshSnippets() {
    await this.plugin.loadSnippets();
    this.items = this.plugin.snippets;
  }
  getItems() {
    return Object.keys(this.items);
  }
  getItemText(item) {
    return item;
  }
  onChooseItem(item, evt) {
    const value = this.plugin.snippets[item];
    navigator.clipboard.writeText(value).then(() => {
      new import_obsidian.Notice(`Copied snippet: ${item}`);
    });
    if (evt.metaKey || evt.ctrlKey) {
      this.insertSnippetAtCursor(value);
    }
  }
  insertSnippetAtCursor(value) {
    if (this.editor) {
      this.editor.replaceSelection(value);
    } else {
      new import_obsidian.Notice("Active view is not a markdown editor. Snippet was copied to clipboard.");
    }
  }
  onOpen() {
    super.onOpen();
    this.displayInstructions();
  }
  displayInstructions() {
    this.setInstructions([
      { command: "\u21B5", purpose: "to copy to clipboard" },
      { command: "\u2318 \u21B5", purpose: "to copy and paste at cursor position" }
    ]);
  }
};

// src/SnippetManagerSettingTab.ts
var import_obsidian2 = require("obsidian");
var SnippetManagerSettingTab = class extends import_obsidian2.PluginSettingTab {
  constructor(app, plugin) {
    super(app, plugin);
    this.plugin = plugin;
  }
  display() {
    const { containerEl } = this;
    containerEl.empty();
    new import_obsidian2.Setting(containerEl).setName("Snippets file path or Snippets folder path").setDesc("Path to the markdown file where snippets are stored. or Path to Folder which contains multiple Snippets file").addText((text) => text.setPlaceholder("Snippets.md").setValue(this.plugin.settings.snippetPath).onChange(async (value) => {
      if (value.endsWith("/")) {
        value = value.slice(0, -1);
      }
      this.plugin.settings.snippetPath = value;
      await this.plugin.saveSettings();
      this.plugin.clearSnippets();
    }));
  }
};

// src/SnippetManagerPlugin.ts
var DEFAULT_SETTINGS = {
  snippetPath: "Snippets.md"
  // Default to single file for backward compatibility
};
var SnippetManagerPlugin = class extends import_obsidian3.Plugin {
  constructor() {
    super(...arguments);
    this.snippets = {};
    this.lastModifiedTimes = {};
  }
  // Track modified times for multiple files
  async onload() {
    await this.loadSettings();
    this.addSettingTab(new SnippetManagerSettingTab(this.app, this));
    this.addCommand({
      id: "open-snippet-search",
      name: "Search Snippets",
      editorCallback: (editor, view) => {
        new SnippetSuggestModal(this.app, this, editor).open();
      }
    });
  }
  clearSnippets() {
    this.snippets = {};
    this.lastModifiedTimes = {};
  }
  async loadSnippets() {
    const snippetPath = this.settings.snippetPath;
    const fileOrFolder = this.app.vault.getAbstractFileByPath(snippetPath);
    if (!fileOrFolder) {
      new import_obsidian3.Notice(`Snippet path not found: ${snippetPath}`);
      return;
    }
    if (fileOrFolder instanceof import_obsidian3.TFolder) {
      const markdownFiles = fileOrFolder.children.filter(
        (file) => file instanceof import_obsidian3.TFile && file.extension === "md"
      );
      const addFilePrefix = markdownFiles.length > 1;
      for (let file of markdownFiles) {
        if (file instanceof import_obsidian3.TFile) {
          await this.loadSnippetsFromFile(file, addFilePrefix);
        }
      }
    } else if (fileOrFolder instanceof import_obsidian3.TFile && fileOrFolder.extension === "md") {
      await this.loadSnippetsFromFile(fileOrFolder, false);
    } else {
      new import_obsidian3.Notice(`Invalid snippet path: ${snippetPath}`);
    }
  }
  async loadSnippetsFromFile(file, addFilePrefix) {
    const filePath = file.path;
    const fileStat = await this.app.vault.adapter.stat(filePath);
    const modifiedTime = fileStat == null ? void 0 : fileStat.mtime;
    if (modifiedTime && (!this.lastModifiedTimes[filePath] || modifiedTime > this.lastModifiedTimes[filePath])) {
      const content = await this.app.vault.cachedRead(file);
      const contentCache = this.app.metadataCache.getFileCache(file);
      Object.assign(this.snippets, this.getSnippets(content, contentCache, addFilePrefix ? file.basename : null));
      this.lastModifiedTimes[filePath] = modifiedTime;
      new import_obsidian3.Notice(`Snippets reloaded from: ${filePath}`);
    }
  }
  getSnippets(content, contentCache, filePrefix) {
    const snippets = {};
    if (!(contentCache == null ? void 0 : contentCache.headings)) {
      return snippets;
    }
    const headings = contentCache.headings;
    const level = headings[0].level;
    for (let i = 0; i < headings.length; i++) {
      if (headings[i].level !== level) {
        new import_obsidian3.Notice(`Please follow the same heading level throughout the file`);
        return snippets;
      }
    }
    for (let i = 0; i < headings.length; i++) {
      const currentHeading = headings[i];
      let sectionContent = "";
      if (i + 1 === headings.length) {
        sectionContent = content.slice(currentHeading.position.end.offset + 1);
      } else {
        const nextHeading = headings[i + 1];
        sectionContent = content.slice(
          currentHeading.position.end.offset + 1,
          nextHeading.position.start.offset - 1
        );
      }
      sectionContent = this.stripCodeBlockFormatting(sectionContent).trim();
      const snippetKey = filePrefix ? `${filePrefix}: ${currentHeading.heading}` : currentHeading.heading;
      snippets[snippetKey] = sectionContent;
    }
    return snippets;
  }
  stripCodeBlockFormatting(content) {
    return content.replace(/```[\s\S]*?```/g, (match) => {
      return match.replace(/```(\w+)?\n?/, "").replace(/\n?```$/, "");
    });
  }
  async loadSettings() {
    const data = await this.loadData();
    if ((data == null ? void 0 : data.snippetFilePath) && !data.snippetPath) {
      data.snippetPath = data.snippetFilePath;
      delete data.snippetFilePath;
    }
    this.settings = Object.assign({}, DEFAULT_SETTINGS, data);
    await this.saveSettings();
  }
  async saveSettings() {
    await this.saveData(this.settings);
  }
};

// src/main.ts
var main_default = SnippetManagerPlugin;