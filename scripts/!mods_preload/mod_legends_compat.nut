::ModLegendsCompat <- {
	ID = "mod_legends_compat",
	Name = "Legends Compatibility",
	Version = "1.0.0",
};

::ModLegendsCompat.HooksMod <- ::Hooks.register(::ModLegendsCompat.ID, ::ModLegendsCompat.Version, ::ModLegendsCompat.Name);

::ModLegendsCompat.HooksMod.require("mod_msu >= 1.2.7", "mod_modern_hooks >= 0.5.4", "mod_legends >= 19.3.0");

::ModLegendsCompat.HooksMod.queue(">mod_msu", ">mod_legends", "<mod_fury_of_the_northmen", "<mod_PoV", "<mod_ROTUC", function () {
	::ModLegendsCompat.Mod <- ::MSU.Class.Mod(::ModLegendsCompat.ID, ::ModLegendsCompat.Version, ::ModLegendsCompat.Name);

	::HasFotn <- ::Hooks.hasMod("mod_fury_of_the_northmen");
	::HasPov <- ::Hooks.hasMod("mod_PoV");
	::HasRotu <- ::Hooks.hasMod("mod_ROTUC");

	// Register with MSU so people know to update
	::ModLegendsCompat.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/mnshdw/LegendsCompat");
	::ModLegendsCompat.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	// MSU config page
	local page = ::ModLegendsCompat.Mod.ModSettings.addPage("Legends Compatibility");
	// local settingEnabled = page.addBooleanSetting(
	// 	"Enabled",
	// 	true,
	// 	"Enabled",
	// 	"When enabled, ."
	// );
	// settingEnabled.addCallback(function (_value) {
	// 	::ModLegendsCompat.Enabled = _value;
	// });
	page.addDivider("divider");

	// ::include("mod_legends_compat/config/perk_trees");

}, ::Hooks.QueueBucket.Normal);
