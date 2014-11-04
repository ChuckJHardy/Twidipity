# Twidipity

### Users

	# Create
	POST /users
	{	
		"token" : 123,
		"email" : "test@example.com"		
	}
	
	HTTP/1.1 201 Created
	Content-Type: application/json
	
	{
		"user" : {
			"id" : 1,
			"token" : 123,
			"email" : "test@example.com"
		}
	{
	
### Compartments	
	
	GET /components
	{
		"components" : {
			"follows" : [
				{ "id" : 1, name: "Random People" }
			],
			"durations" : [
				{ "id" : 1, name: "day" }
				{ "id" : 2, name: "week" }
				{ "id" : 3, name: "month" }
			]
		}
	}
	
### Events

	POST /users/1/events
	{
		"statement" : [3, 1, 2, 2]
	}
	
	HTTP/1.1 201 Created
	Content-Type: application/json
	
	{
		"event" : {
			"id" : 1,
			"state" : "started",
			"started" : "Tue Nov 04 2014 1343",
			"stopped" : null,
			"roped" : {
				"initial" : [
					{ handle: "chuckjhardy", image: "http://example.com/image.png" }
				]
			},
			"statement" {
				"rope" : {
					"count" : 3,
					"component" : 1
				},
				"duration" : {
					"count" : 2,
					"component" : 2
				}
			}	
		}
	}
	
	PUT /users/1/events/1
	{
		state: "stopped"
	}
	
	HTTP/1.1 200 OK
	Content-Type: application/json
	
	{
		"event" : {
			"id" : 1,
			"state" : "stopped",
			"started" : "Tue Nov 04 2014 1343",
			"stopped" : "Tue Nov 04 2014 1423",
			"roped" : {
				"initial" : [
					{ handle: "chuckjhardy", image: "http://example.com/image.png" }
				]
			},
			"statement" {
				"rope" : {
					"count" : 3,
					"component" : 1
				},
				"duration" : {
					"count" : 2,
					"component" : 2
				}
			}	
		}
	}