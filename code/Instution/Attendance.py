from __future__ import annotations

from typing import TYPE_CHECKING

from Base import Base

if TYPE_CHECKING:
    from Course import Course
    from User import User
    from Student import Student
    from Tutor import Tutor
    from Event import Event

'''
    Mark Class
'''
class Attendance(Base):
    def __init__(self, event, attendee, marker=None):
        super().__init__(self)
        
        self._attandee  :User   = attendee
        self._marker    :User   = marker

        self._attended  :bool   = False
        self._duration  :int    = 0
        
        self._event     :Event  = event

        for user in [attendee, marker]:
            if user != None:
                self.add_user(user)
    

    def get_event(self) -> Event:
        return self._event

    def add_user(self, user: User) -> None:
        user.add_engagement(self)
        self.handle_user(user)
    
    def handle_user(self, user: Tutor) -> None:
        pass

    def handle_user(self, user: Student) -> None:
        pass
    