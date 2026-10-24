class_name Decisions
enum State {
	IDLE,
	WALK,
	JUMP,
}

enum Room_Decisions{
	WALK_NORTH,
	WALK_EAST,
	WALK_SOUTH,
	WALK_WEST,
	JUMP_UP,
	JUMP_OVER,
}

enum Item_Decisions{
	PICK_UP,
	DROP_ITEM,
	USE_ITEM,
}
