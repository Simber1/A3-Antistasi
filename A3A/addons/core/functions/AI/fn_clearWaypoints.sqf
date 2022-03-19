params [["_group", grpNull, [grpNull, objNull]]];

_group = _group call A3A_fnc_getObjectGroup;

// Waypoint index changes with each deletion, so don't delete _x
private _waypoints = waypoints _group;
{
    deleteWaypoint [_group, 0];
} forEach _waypoints;

if (units _group isNotEqualTo []) then {

    // Create a self-deleting waypoint at the leader position to halt all planned movement (based on old waypoints)
    private _wp = _group addWaypoint [getPosASL leader _group, -1];
    _wp setWaypointStatements ["true", "deleteWaypoint [group this, currentWaypoint (group this)]"];
	
};