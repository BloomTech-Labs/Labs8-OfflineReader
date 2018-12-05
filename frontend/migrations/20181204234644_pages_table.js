exports.up = function(knex, Promise) {
	return knex.schema.createTable('pages', function(tbl) {
		// primary key
		tbl.increments('Id');
		tbl.string('title', 256).notNullable();
		tbl.string('author', 256);
		tbl.string('normal_url', 256).notNullable();
		tbl.string('resolved_url', 256).notNullable();
		tbl.string('date_saved', 256);
		tbl.string('date_published', 256);
		tbl.string('excerpt', 256);
		// Need to circle back for this one
		tbl.bindBlob('cover_image', 256).notNullable();
		//
		tbl.string('tags', 256);
		tbl.string('text', 256).notNullable();
		tbl.timestamp('createdAt').defaultTo(knex.fn.now());
	});
};

exports.down = function(knex, Promise) {
	return knex.schema.dropTableIfExists('pages');
};
