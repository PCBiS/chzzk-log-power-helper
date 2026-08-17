import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";

const manifest = JSON.parse(await readFile("manifest.json", "utf8"));
const content = await readFile("content.js", "utf8");
const packageScript = await readFile("scripts/package.ps1", "utf8");

assert.equal(manifest.manifest_version, 2);
assert.equal(manifest.name, "치지직 통나무 파워 도우미");
assert.equal(manifest.version, "1.3.2");
assert.ok(manifest.permissions.includes("https://api.chzzk.naver.com/*"));
assert.equal(manifest.browser_specific_settings?.gecko?.id, "chzzk-log-power-helper@pcbis.github.io");
assert.equal(manifest.browser_specific_settings?.gecko_android?.strict_min_version, "142.0");
assert.deepEqual(
  manifest.browser_specific_settings?.gecko?.data_collection_permissions?.required,
  ["browsingActivity", "websiteContent", "websiteActivity"],
);
assert.doesNotMatch(manifest.name, /Mozilla|Firefox/i);
assert.match(content, /claim\.claimType === "WATCH_1_HOUR"/);
assert.match(content, /text\.includes\("통나무"\)/);
assert.match(content, /text\.includes\("1시간"\)/);
assert.match(content, /hasRecentViewInStorage \|\| hasRecentViewInMemory/);
assert.doesNotMatch(content, /await chrome\.storage\./);
assert.doesNotMatch(content, /\.innerHTML\s*=/);
assert.match(packageScript, /AMO-UPLOAD-chzzk-log-power-helper-1\.3\.2\.zip/);
assert.match(packageScript, /manifest\.json is not at the ZIP root/);

console.log("Firefox port checks passed.");
