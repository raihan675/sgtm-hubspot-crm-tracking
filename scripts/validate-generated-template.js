const fs = require('fs');
const vm = require('vm');

const tpl = fs.readFileSync('C:/Users/Webanalyticspro BD/Downloads/meta-crm-offline-conversions-tag.tpl', 'utf8');

function getSections(text) {
  const map = {};
  const regex = /^___([A-Z_]+)___/gm;
  let match;
  const indices = [];
  while ((match = regex.exec(text)) !== null) {
    indices.push({ name: match[1], start: match.index, contentStart: regex.lastIndex });
  }
  for (let i = 0; i < indices.length; i++) {
    const end = i < indices.length - 1 ? indices[i + 1].start : text.length;
    map[indices[i].name] = text.substring(indices[i].contentStart, end).trim();
  }
  return map;
}

const sections = getSections(tpl);

console.log('1. Checking INFO section:');
const info = JSON.parse(sections.INFO);
console.log('   Display Name:', info.displayName);
console.log('   Brand present?:', !!info.brand);
if (info.brand) throw new Error('Brand must not be present!');

console.log('\n2. Checking TEMPLATE_PARAMETERS JSON:');
const params = JSON.parse(sections.TEMPLATE_PARAMETERS);
console.log('   Top-level parameter groups:', params.length);

console.log('\n3. Checking SERVER_PERMISSIONS JSON:');
const perms = JSON.parse(sections.SERVER_PERMISSIONS);
console.log('   Permission count:', perms.length);
perms.forEach(p => console.log('   -', p.instance.key.publicId));

console.log('\n4. Checking SANDBOXED_JS_FOR_SERVER syntax (inside function wrapper):');
try {
  new vm.Script('function runGtmTag(data) {\n' + sections.SANDBOXED_JS_FOR_SERVER + '\n}');
  console.log('   Syntax is 100% valid JavaScript!');
} catch (e) {
  console.error('   Syntax error in JS:', e);
  process.exit(1);
}

console.log('\n5. Checking for any "stape" or vendor occurrences:');
const stapeMatches = (tpl.match(/stape/gi) || []).length;
console.log('   Matches found:', stapeMatches);
if (stapeMatches > 0) throw new Error('Stape references found!');

console.log('\n6. Checking BOM and line endings:');
console.log('   Starts with UTF-8 BOM?:', tpl.charCodeAt(0) === 0xFEFF);

console.log('\nALL 6 CHECKS PASSED PERFECTLY!');
