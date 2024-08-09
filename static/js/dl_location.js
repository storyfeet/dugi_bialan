
class Location {
	constructor(name, description) {
		this.name = name;
		this.description = description
		this.routes = {};
		this.items = {};
	}
	addRoute(route) {
		this.routes[route.name] = route;
		return this;
	}

	addItem(item) {
		this.items[item.name] = item;
		return this;
	}

}

class Route {
	constuctor(name, description, destination) {
		this.name = name;
		this.description = description;
		this.destination = destination;
	}
}

class Item {
	constructor(name, description) {
		this.name = name;
		this.description = description;
	}
}

class Job {
	constuctor(name, description) {
	}
}


const locations = {
	"beach": new Location("beach", "Here Sandy Shores"),
	"boat": new Location("boat", "Your boat is broken. The Sails are torn, there is a hole in the side"),
};



