const db = require('../data/dbConfig');


const find = () =>{
    return db('schemes')
    .select('*')
};

const findSteps = id =>{
    return db
    .select('steps.*')
    .from('steps')
    .join('schemes', 'schemes.id', '=', 'steps.scheme_id')
    .where('schemes.id', id)
      .orderBy('steps.step_number');

    };

    const findById = id =>{
    return db('schemes')
    .select('*')
    .where({id})
    .first();
};





const add = scheme =>{
    
    return db('schemes', 'id')
    .insert(scheme)
    .then(id => findById(...id));

};


const update = (changes, id) =>{

    return db('schemes')
    .where('id', id)
    .update(changes, '*')
    .then(count => findById(id));

};


const remove = id =>{

    return db('schemes')
    .where({id})

    .delete();

};

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};