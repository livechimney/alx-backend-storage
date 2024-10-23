#!/usr/bin/env python3
"""
 inserts a new document in a collection based on kwargs:

Prototype: def insert_school(mongo_collection, **kwargs):
mongo_collection will be the pymongo collection object
Returns the new _id
"""
def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document into the given MongoDB collection

    Args:
        mongo_collection: A PyMongo collection object
        **kwargs: Keyword arguments to insert into the collection

    Returns:
        str: The newly inserted document's _id
    """
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
