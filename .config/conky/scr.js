const doomsdayClock = require("doomsday-clock");

(async () => {
	const { seconds } = await doomsdayClock();
	console.log(`There are ${seconds} seconds 'till midnight!`);
})();
