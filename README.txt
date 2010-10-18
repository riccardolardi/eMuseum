ZHDK IAD Project 2010
Graphical User Interfaces I

ZHdK eMuseum Serach Gallery

Daniel Schmider, Sebastian Homberger, Riccardo Lardi
Prof. Jürgen Späth, Dipl. Inform. Magnus Rembold

---

INTRODUCTION This project aimed to redesign the current eMuseum search engine (http://sammlungen-archive.zhdk.ch/code/emuseum.asp) by finding an alternative concept to it and develop it in Flash/AS3.

Our idea was to develop a search engine which uses tags to sort and manage content. Dynamic search queries should be made possible by offering the possibility to add/delete filter options at any time. Statistic feedback of the amount of the currently generated query results and the number of results per tag (the tag's 'weight') should also be focussed. Also, a browsing experience should be given to the user.

THE PROBLEM The current search application suffers substantially from technical, esthetical and user experience drawbacks.

1 Search queries can only be defined at one point, so the user must switch back to the start (losing his query he made before). The search options page and the results page are apart from each other.
2 Keywords must match the chosen key (no search within all keys possible). What if the user doesn't know or care of which key exactly his keyword must match? Keys can also have a similiar meaning but may lead to different results.
3 No statistical feedback available - the user doesn't know how big his query may be. He is forced to try out different combinations of terms while always switching back to the search options page.

The amount of ∼ 10'000 images should be now made more easily accessible.

THE CONCEPT Our concept relies on five basic points:

1 Usage of tags (meta data) as search filters
Contents should be managed via their meta data, using them as tags. When they are used for search queries, they become filters and are appended to the search query string. They then can be deleted and removed from the query chain.

2 Dynamic change of search filters
The user should be able to add and remove earch filters at anytime. No search query must get lost when changing pages i.e. the results view, meta data view or single image view. The handling with filters is made clear by using a green button for adding filters, a red button for removing filters and a blue button to start new searches with one single filter. Custom filters are possible too, by entering a search term in the provided text field.

3 Statistic feedback
The user must always be able to become aware of every tag's weight, namely the result count that one certain filter would offer if searched for. This way it is possible to combine search filters while having a feeling of how big/small the search result count could become.

4 Filter suggestions
The application should offer filter suggestions depending on the current search query result's content information. So if "Switzerland" and "Snow" are active filters, you may be offered filters like "Skiing" or "Ice skating".

5 Free browsing of images (serendipity)
The application should not only offer the possibility to search for a certain content, but also to browse the data as an image gallery, being led from one image to another. Meta data functions as links to more content by offering itself as search filters.

THE PRODUCT is a prototype which should give insight into our concept idea and show up the main functionality and usage of our application.

- Oct 18 2010