"""
Reusable UI components for Crossbill plugin
"""

from aqt import mw
from aqt.qt import QComboBox


def create_deck_selector(default_deck: str | None = None) -> QComboBox:
    """
    Create a QComboBox populated with all available Anki decks.

    Args:
        default_deck: The name of the deck to select by default. If None or not found,
                     the first deck will be selected.

    Returns:
        QComboBox configured with all available decks
    """
    deck_combo = QComboBox()
    deck_names = sorted(mw.col.decks.all_names())
    deck_combo.addItems(deck_names)

    # Set default deck if specified
    if default_deck:
        index = deck_combo.findText(default_deck)
        if index >= 0:
            deck_combo.setCurrentIndex(index)

    return deck_combo
