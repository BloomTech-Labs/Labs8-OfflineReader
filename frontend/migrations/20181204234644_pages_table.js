//This table structures the Pages schema for the sqlite db used for offline storage/syncing of a users pages

exports.up = function(knex, Promise) {
	return knex.schema.createTable('pages', function(tbl) {
		// primary key
		tbl.increments();
		tbl.string('title', 255).notNullable();
		tbl.string('author', 255);
		tbl.text('normal_url').notNullable();
		tbl.text('resolved_url');
		tbl.timestamp('date_saved').defaultTo(knex.fn.now());
		tbl.string('date_published');
		tbl.text('excerpt', 512);
		tbl.binary('cover_image');
		tbl.binary('video');
		tbl.binary('audio');
		tbl.text('tags', 512);
		tbl.text('text');
	});
};

exports.down = function(knex, Promise) {
	return knex.schema.dropTableIfExists('pages');
};
