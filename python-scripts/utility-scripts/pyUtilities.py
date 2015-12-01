# This contains classes, and methods for performing server side functions
# mbee
import json, sys, httplib, urllib

def addview(viewToAddId, parentView):
    child = json.loads(viewToAddId)
    parent = json.loads(parentView)

    if (child is None or parent is None):
        return "Neither are views"  # change to error type server can utilize

    # if(child.)
    # if(parent.specialization.view2view)
