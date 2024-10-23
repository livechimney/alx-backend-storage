#!/usr/bin/env python3
"""
Script that lists all documents in a collection
"""
import pymongo


def list_all(mongo_collection):
    """
    Lists all documents in the given MongoDB collection.

    Args:
        mongo_collection: A PyMongo collection object.

    Returns:
        list: A list of all documents in the collection.
    """
    return list(mongo_collection.find({}))
