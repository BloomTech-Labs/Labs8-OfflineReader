//This table structures the Pages schema for the sqlite db used for offline storage/syncing of a users pages

exports.up = function(knex, Promise) {
	return knex.schema.createTable('pages', function(tbl) {
		// primary key
		tbl.increments();
		tbl.string('title', 512).notNullable();
		tbl.string('author', 256);
		tbl.string('normal_url').notNullable();
		tbl.string('resolved_url');
		tbl.timestamp('date_saved').defaultTo(knex.fn.now());
		tbl.string('date_published');
		tbl.string('excerpt', 512);
		tbl.binary('cover_image');
		tbl.binary('video');
		tbl.binary('audio');
		tbl.string('tags', 512);
		tbl.text('text');
	});
};

exports.down = function(knex, Promise) {
	return knex.schema.dropTableIfExists('pages');
};
