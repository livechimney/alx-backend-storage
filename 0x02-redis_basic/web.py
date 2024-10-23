#!/usr/bin/env python3
"""
Uses the requests module to obtain
the HTML content of a particular URL and returns it.
"""
import requests
import redis
from typing import Callable
from functools import wraps

""" Initialize Redis client """
redis_client = redis.Redis()


def count_calls(method: Callable) -> Callable:
    """ Decorator to store the history of inputs and
    outputs for a particular function.
    """
    @wraps(method)
    def wrapper(url) -> str:
        """ Wrapper for decorator functionality """
        redis_client.incr(f'count:{url}')
        result = redis_client.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        redis_client.set(f'count:{url}', 0)
        redis_client.setex(f'result:{url}', 10, result)
        return result
    return wrapper


@count_calls
def get_page(url: str) -> str:
    """ Returns the HTML content of a given URL
    after caching the request's response
    and tracking the request.
    """
    response = requests.get(url)
    return response.text
