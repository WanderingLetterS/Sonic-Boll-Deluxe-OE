#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

instance_create(x,y,phaser)

tile_bake(global.master[biome],56,376,16,16,x,y,1000001)

instance_destroy();
