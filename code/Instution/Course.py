from Base   import Base
from User   import User
from Event  import Event
from typing import List
'''
    Course class
'''
class Course(Base):
    
    def __init__(self, id: int, admin: User=None):
        super().__init__(id)
        self._admin     :User        = admin
        self._users     :List[User]  = []
        self._events    :List[User]  = []

    def get_events(self) -> Event:
        return self._events
    
    def add_event(self, event: Event) -> None:
        Base.add_something(event, self.get_events())
    
    def add_events(self, events: list[Event]) -> None:
        Base.add_somethings(events, self.get_events())
    
    def get_users(self: List[User]) -> List[User]:
        return self._users

    def add_user(self, user: User) -> None:
        Base.add_something(user, self.get_users())

    def add_users(self, users: List[User]) -> None:
        Base.add_somethings(users, self.get_users())
    
    def notify(self):
        for user in self.get_users():
            user.update(self)

    def generate_html(self):
        return ""
    
    def __repr__(self) -> str:
        return super().__repr__()
    
    def __str__(self) -> str:
        return super().__str__()